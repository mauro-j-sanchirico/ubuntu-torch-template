"""Example script to test Python package imports."""

import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import scipy
import seaborn as sns
import sklearn
import torch
import torchvision

from projectname.my_module import hello

print(np.__version__)
print(matplotlib.__version__)
print(torch.__version__)
print(torchvision.__version__)
print(sklearn.__version__)
print(pd.__version__)
print(sns.__version__)
print(scipy.__version__)

hello()
