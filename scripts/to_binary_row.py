import glob
import pathlib
import jsonlines
import struct

def convert(filename):

    cwd = pathlib.Path().absolute()
    path = pathlib.Path(filename)
    stem = path.stem
    parent = path.parent

    input_fullpath = cwd / path

    output_filename = stem + '.row.bin'
    output_parent = cwd / parent
    output_fullpath = output_parent / output_filename

    output_parent.mkdir(parents=True, exist_ok=True)

    with open(output_fullpath, "wb") as outfile:
        # Write placeholder for the line count
        # We write 0 for now because we don't know the count yet.
        # <I = Little Endian Unsigned Int (4 bytes)
        outfile.write(struct.pack('<I', 0)) 

        count = 0
        with jsonlines.open(input_fullpath) as reader:
            for obj in reader:
                propositions = [False, False, False, False]
                time = obj['time']
                if 'p' in obj and obj['p'] == True:
                    propositions[0] = True
                if 'q' in obj and obj['q'] == True:
                    propositions[1] = True
                if 'r' in obj and obj['r'] == True:
                    propositions[2] = True
                if 's' in obj and obj['s'] == True:
                    propositions[3] = True

                # Pack into binary
                # Format string:
                # <   : Little Endian
                # i   : int (4 bytes)
                # ?   : boolean (1 byte)
                fmt = '<i????'
                binary_data = struct.pack(fmt, time, *propositions)
                outfile.write(binary_data)
                count += 1

            # Move file pointer back to the very beginning (byte 0)
            outfile.seek(0) 
            # Overwrite the placeholder 0 with the actual count
            outfile.write(struct.pack('<I', count))


if __name__ == "__main__":

    traces = glob.glob('**/*.jsonl', recursive=True)

    for trace in  glob.glob('**/*.jsonl', recursive=True):
        convert(trace)


