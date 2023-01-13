import tensorflow as tf
import os
import numpy as np
from PIL import Image
from matplotlib.pyplot import imshow
import matplotlib.pyplot as plt
import torch

# colab
image_path = tf.keras.utils.get_file(
      'fib.png',
      'https://firebasestorage.googleapis.com/v0/b/research-decab.appspot.com/o/fibonacci.jpg?alt=media&token=bd773419-1c6c-4fbd-a413-f8469439e3c1',
      extract=True)
image_path = os.path.join(os.path.dirname(image_path), 'fib.png')
im = Image.open(image_path)
img = np.asarray(im)

img_rgb = torch.from_numpy(img)
imshow(img_rgb); plt.show()
