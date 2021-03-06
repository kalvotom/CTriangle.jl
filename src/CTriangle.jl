module CTriangle

depsjl = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")

if isfile(depsjl)
	include(depsjl)
else
	error("CTriangle is not properly installed. Please try to run\nPkg.build(\"CTriangle\")")
end

include("Includes.jl")

"""
    triangulate(fileName::String, options::String = "")

# Arguments
* `fileName::String`: the path to the file with or without extension.
* `options::String = ""`: the available options for the triangulations.
"""
function triangulate(fileName::String, options::String = "")
	commandLine::CommandLine = CommandLine()
	execute(
		createCommand(commandLine, parseOptions(commandLine, options), fileName)
	)
end

"""
    triangulate(points::Matrix{Cdouble}, options::String = "")

# Arguments
* `points::Matrix{Cdouble}`: points to be triangulated.
* `options::String = ""`: the available options for the triangulation.
"""
function triangulate(points::Matrix{Cdouble}, options::String = "")
	execute(DelaunayUserCommand(
		parseOptions(CommandLine(), options), vec(points))
	)
end

"""
    triangulate(points::Matrix{Int}, options::String = "")

# Arguments
* `points::Matrix{Int}`: points to be triangulated.
* `options::String = ""`: the available options for the triangulation.
"""
function triangulate(points::Matrix{Int}, options::String = "")
	triangulate(convert(Matrix{Cdouble}, points), options)
end

export triangulate
export getNode
export getNodes
export getElement
export getElements
export getNeighbors
export getSegments
export getHoles
export getEdges

end
