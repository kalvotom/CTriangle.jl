function getNode(triangulation::TriangulationInterface, index::Int)
  getNode(triangulation.nodeSection, index)
end

function getNodes(triangulation::TriangulationInterface)
  getNodes(triangulation.nodeSection)
end

function getElement(triangulation::TriangulationInterface, index::Int)
  getElement(triangulation.elementSection, index)
end

function getElements(triangulation::TriangulationInterface)
  getElements(triangulation.elementSection)
end