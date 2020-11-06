import struct
import Timescales_pb2 as Timescales


def protobuf_reader(filename):

    with open(filename, "rb") as f:
        while True:
            buf = f.read(4)  # Read UInt32 size prefix
            if not buf:
                break
            size = struct.unpack('<I', buf)[0]
            buf = f.read(size)

            msg = Timescales.Message()
            msg.ParseFromString(buf)

            yield msg


if __name__ == "__main__":
    import sys
    for msg in protobuf_reader(sys.argv[1]):
        print(msg)
