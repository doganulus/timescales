#!/bin/bash
hyperfine \
    --warmup 1 \
    --runs 2 \
    --export-json "results/reelay.discrete.djv.1M.$(date +%s).json" \
    --command-name Access \
        "ryjson -x 'forall[u,f]. {event: access, access_1: *u, access_2: *f} -> (not{event: close, close_1: *f} since {event: open, open_1: *f})' dejavu/examples/access/log4.jsonl" \
    --command-name File \
        "ryjson -x 'forall[f]. {event: close, close_1: *f} -> pre(not{event: close, close_1: *f} since {event: open, open_1: *f})' dejavu/examples/file/log4.jsonl" \
    --command-name LocksBasic \
        "ryjson -x 'forall[t,l]. {event: sleep, sleep_1: *t} -> not(not{event: rel, rel_1: *t, rel_2: *l} since {event: acq, acq_1: *t, acq_2: *l}) and {event: acq, acq_1: *t, acq_2: *l} -> not exists[s]. pre(not{event: rel, rel_1: *s, rel_2: *l} since {event: acq, acq_1: *s, acq_2: *l}) and {event: rel, rel_1: *t, rel_2: *l} -> pre(not{event: rel, rel_1: *t, rel_2: *l} since {event: acq, acq_1: *t, acq_2: *l})' dejavu/examples/locks/basic/log4.jsonl" \
    --command-name LocksDataraces \
        "ryjson -x 'forall[t1,t2,x]. (once({event: read, read_1: *t1, read_2: *x} or {event: write, write_1: *t1, write_2: *x}) and once({event: write, write_1: *t2, write_2: *x})) -> (exists[l]. H(({event: read, read_1: *t1, read_2: *x} or {event: write, write_1: *t1, write_2: *x})-> not{event: rel, rel_1: *t1, rel_2: *l} since {event: acq, acq_1: *t1, acq_2: *l}) and H(({event: read, read_1: *t2, read_2: *x} or {event: write, write_1: *t2, write_2: *x})-> not{event: rel, rel_1: *t2, rel_2: *l} since {event: acq, acq_1: *t2, acq_2: *l}))' dejavu/examples/locks/dataraces/log4.jsonl" \
    --command-name LocksDeadlocks \
        "ryjson -x 'forall[t1, t2, l1, l2]. (pre(not{event:rel, rel_1: *t1, rel_2: *l1} since {event:acq, acq_1: *t1, acq_2: *l1}) and {event:acq, acq_1: *t1, acq_2: *l2}) -> (not(pre(once(pre(not{event:rel, rel_1: *t2, rel_2: *l2} since {event:acq, acq_1: *t2, acq_2: *l2}) and {event:acq, acq_1: *t2, acq_2: *l1} ))))' dejavu/examples/locks/deadlocks/log4.jsonl" \
    --command-name TimedAccess \
        "ryjson -x 'forall[u,f]. {event: access, access_1: *u, access_2: *f} -> (((not{event: logout, logout_1: *u}) since[:50] {event: login, login_1: *u}) and ((not{event: close, close_1: *f}) since[:50] {event: open, open_1: *f}))' dejavu/examples/timed/access/log.1000k.timed.jsonl" \
    --command-name TimedCommands \
        "ryjson -x 'forall[m]. {event: suc, suc_1: *m} -> (exists[p]. not{event: fail, fail_1: *m} since[:50] {event: dis, dis_1: *m, dis_2: *p})' dejavu/examples/timed/commands/log.1000k.timed.jsonl" \
