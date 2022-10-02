import jax.numpy as np
from jax import random
import jax

key = jax.random.PRNGKey(0)
x = jax.random.normal(key, (5000, 5000))
print(np.dot(x, x.T) / 2)
print(np.dot(x, x.T) / 2)

"""
Use:
# activate env
. /path/to/env.env
# conda activate jax

python test_jax.py
"""
