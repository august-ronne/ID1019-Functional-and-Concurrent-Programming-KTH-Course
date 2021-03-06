defmodule World do
	
	@background {0, 0, 0}
	@depth 2
	@ambient {0.3, 0.3, 0.3}
	@refraction 1

	require Record

	Record.defrecord(:world,
		objects: [],
		lights: [],
		background: @background,
		depth: @depth,
		ambient: @ambient,
		refraction: @refraction)
	
end