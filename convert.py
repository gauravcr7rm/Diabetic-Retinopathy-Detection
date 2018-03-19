""" Resize and crop images to square """
from __future__ import division, print_function
import os
from multiprocessing.pool import Pool

import click
import numpy as np
from PIL import Image, ImageFilter

import data

N_PROC = 2

def convert(filename, crop_size):
	img =Image.open(filename)
	blurred = img.filter(ImageFilter.BLUR)
	ba = np.array(blurred)
	h, w, _ = ba.shape

	if w > 1.2 * h:
		left_max = ba[:, : w // 32, :].max(axis=(0, 1)).astype(int)
		right_max = ba[:, -w // 32:, :].max(axis=(0, 1)).astype(int)
		max_bg = np.maximum(left_max, right_max)

		foreground = (ba > max_bg + 10).astype(np.uint8)
		bbox = Image.fromarray(foreground).getbbox()