const CONSTRAINED = "p"

const REFINEMENT = "r"

const QUALITY = "q"

const AREA = "a"

const ATTRIBUTE = "A"

const CONVEX = "c"

const DELAUNAY = "D"

const JETTISON = "j"

const EDGE = "e"

const NEIGHBOR = "n"

const NO_MARKERS = "B"

const IGNORE_HOLES = "O"

const STEINER = "S"

const QUIET = "Q"

type CommandLine
  delaunay::Bool
  constrainedDelaunay::Bool
  refinement::Bool
  useAreas::Bool
  useHoles::Bool
  useRegions::Bool
  CommandLine() = new(true, false, false, false, true, false)
end
