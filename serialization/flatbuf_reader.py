import flatbuffers
from Timescales import Message


def flatbuf_reader(filename):
    with open(filename, "rb") as f:
        while True:
            buf = f.read(4)  # Read UInt32 size prefix
            if not buf:
                break
            size = flatbuffers.util.GetSizePrefix(buf, 0)
            buf = f.read(size)
            msg = Message.Message.GetRootAsMessage(buf, 0)

            obj = dict()

            if msg.Time():
                obj['time'] = msg.Time().Value()

            if msg.PropP():
                obj['p'] = msg.PropP().Value()

            if msg.PropQ():
                obj['q'] = msg.PropQ().Value()

            if msg.PropR():
                obj['r'] = msg.PropR().Value()

            if msg.PropS():
                obj['s'] = msg.PropS().Value()

            yield obj


if __name__ == "__main__":
    import sys
    for msg in flatbuf_reader(sys.argv[1]):
        print(msg)
