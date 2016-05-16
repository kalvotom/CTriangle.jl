# Represents a point in 2D.
immutable Point
  x::Cdouble
  y::Cdouble
end

# Represents a triangle, which has indices into Triangle's pointlist vector.
immutable IndexedTriangle
  a::Cint
  b::Cint
  c::Cint
end

function hasindex(t::IndexedTriangle, index::Integer)
	t.a == index || t.b == index || t.c == index
end

# Represents a segment, which has indices into Triangle's pointlist vector.
immutable IndexedSegment
  a::Cint
  b::Cint
end


# Represents neighbors of each triangle.
# It contains indices into Triangle's trianglelist vector.
immutable IndexedTriangleNeighbors
	a::Cint
	b::Cint
	c::Cint
end

function addneighbor!(neighbors::Vector{Cint}, index::Integer, neighbor::Cint)
  if neighbor > -1
    push!(neighbors, neighbor)
  end
end

function getneighbors(t::IndexedTriangleNeighbors, index::Integer)
  neighbors::Vector{Cint} = Cint[]
  addneighbor!(neighbors, index, t.a)
  addneighbor!(neighbors, index, t.b)
  addneighbor!(neighbors, index, t.c)
  neighbors
end

# Represents a Region
immutable Region
  p::Point
  attr::Cdouble
  maxarea::Cdouble
  function Region(p::Point, attr::Cdouble, maxarea::Cdouble)
    new(p, attr, maxarea)
  end
end

immutable IndexedEdge
  a::Cint
  b::Cint
end
