import glob
import tensorflow as tf
import random

# https://gist.github.com/andres-erbsen/1307752
def itershuffle(iterable,bufsize=1000):
    """Shuffle an iterator. This works by holding `bufsize` items back
    and yielding them sometime later. This is NOT 100% random, proved or anything."""
    iterable = iter(iterable)
    buf = []
    try:
        while True:
            for i in xrange(random.randint(1, bufsize-len(buf))):
                buf.append(iterable.next())
            random.shuffle(buf)
            for i in xrange(random.randint(1, bufsize)):
                if buf:
                    yield buf.pop()
                else:
                    break
    except StopIteration:
        random.shuffle(buf)
        while buf:
            yield buf.pop()
        raise StopIteration


tf.compat.v1.enable_eager_execution(
    config=None,
    device_policy=None,
    execution_mode=None
)

shuffle_tmp_files = 4096
out_fhs = list()

examples = 0

for i in range(shuffle_tmp_files):
	filename = "./shuffle_tmp/" + str(i) + ".examples";
	fh = tf.io.TFRecordWriter(filename)
	out_fhs.append(fh)

# inputs = glob.glob("./training_examples_shuffled/*examples");
inputs = glob.glob("./training_examples_test/*examples");

raw_dataset = tf.data.TFRecordDataset(inputs)
for raw_record in raw_dataset:
  example = tf.train.Example()
  example.ParseFromString(raw_record.numpy())
  print(example)
