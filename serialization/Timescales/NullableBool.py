# automatically generated by the FlatBuffers compiler, do not modify

# namespace: Timescales

import flatbuffers

class NullableBool(object):
    __slots__ = ['_tab']

    # NullableBool
    def Init(self, buf, pos):
        self._tab = flatbuffers.table.Table(buf, pos)

    # NullableBool
    def Value(self): return self._tab.Get(flatbuffers.number_types.BoolFlags, self._tab.Pos + flatbuffers.number_types.UOffsetTFlags.py_type(0))

def CreateNullableBool(builder, value):
    builder.Prep(1, 1)
    builder.PrependBool(value)
    return builder.Offset()
