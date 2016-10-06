Base.close(fileStream::FileStreamInterface) = close(fileStream.fileStream)

Base.read(::FileStreamInterface) = error("Implement method read")

function Base.read(fileStream::NodeStream)
  NodeFile(read(NodeSectionStream(fileStream.fileStream)))
end

function Base.read(fileStream::PolyStream)
  nodeSection = read(NodeSectionStream(fileStream.fileStream))
  if isEmpty(nodeSection)
    nodeFile = read(fileStream.nodeHandler)
    nodeSection = nodeFile.nodeSection
  end
  if isEmpty(nodeSection)
    segmentSection = NoSegmentSection()
    holeSection = NoHoleSection()
    regionSection = NoRegionSection()
  else
    segmentSection = read(SegmentSectionStream(fileStream.fileStream, getStartIndex(nodeSection)))
    holeSection = read(HoleSectionStream(fileStream.fileStream, fileStream.useHoles))
    regionSection = read(RegionSectionStream(fileStream.fileStream, fileStream.useRegions))
  end
  PolyFile(nodeSection, segmentSection, holeSection, regionSection)
end

function Base.read(fileStream::EleStream)
  EleFile(read(ElementSectionStream(fileStream.fileStream, fileStream.startIndex)))
end

function Base.read(fileStream::AreaStream)
  AreaFile(read(AreaSectionStream(fileStream.fileStream)))
end