defmodule Vector do
	
	# Scalar multiplication:
	def smul({x1, x2, x3}, s) do
		{x1 * s, x2 * s, x3 * s}
	end

	# Vector subtraction:
	def sub({x1, x2, x3}, {y1, y2, y3}) do
		{x1 - y1, x2 - y2, x3 - y3}
	end
	# Vector addition:
	def add({x1, x2, x3}, {y1, y2, y3}) do
		{x1 + y1, x2 + y2, x3 + y3}
	end

	# Vector dot product:
	def dot({x1, x2, x3}, {y1, y2, y3}) do
		x1 * y1 + x2 * y2 + x3 * y3
	end

	# Scale a vector to a specified length:
	def scale(x, l) do
		n = norm(x)
		# This will crash if N == 0
		smul(x, l / n)
	end

	# Normalize a vector (scale to length = 1):
	def normalize(x) do
		scale(x, 1)
	end

	# Square of a vector (number):
	def sq(x) do
		dot(x, x)
	end

	# The norm (length) of a vector:
	def norm({x1, x2, x3}) do
		:math.sqrt(x1 * x1 + x2 * x2 + x3 * x3)
	end

	# Cross product, used to find a vector that is orthogonal to both vectors x and y:
	def cross({x1, x2, x3}, {y1, y2, y3}) do
		{x2 * y3 - x3 * y2, x3 * y1 - x1 * y3, x1 * y2 - x2 * y1}
	end
end