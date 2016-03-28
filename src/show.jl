#SpiceData: Show functions
#-------------------------------------------------------------------------------

Base.show(io::IO, ::BigEndian) = print(io, "BigEndian")
Base.show(io::IO, ::LittleEndian) = print(io, "LittleEndian")

Base.showcompact(io::IO, ::SpiceFormat) = print(io, "Format:Unknown")
Base.showcompact(io::IO, ::Format_9601) = print(io, "SPICE:9601")
Base.showcompact(io::IO, ::Format_9602) = print(io, "CppSim:9602")

Base.show(io::IO, fmt::Format_Unknown) = showcompact(io, fmt)

function Base.show(io::IO, fmt::SpiceFormat)
	showcompact(io, fmt)
	print(io, " (x: $(xtype(fmt))[], y: $(xtype(fmt))[])")
end

function Base.showcompact(io::IO, r::DataReader)
	print(io, DataReader, "(")
	print(io, basename(r.filepath))
	print(io, ", nsig=", length(r.signalnames))
	print(io, ", npts=", length(r.sweep))
	print(io, ", ")
	print(io, r.format)
	print(io, ")")
end

function Base.show(io::IO, r::DataReader)
	showcompact(io, r)
	println(io)
	print(io, ">> (", r.endianness, ")")
	print(io, " sweep = '", r.sweepname, "'")
	println(io)
	tags = r.tags
	println(io, ">> ", tags.date, " (", tags.time, ")")
	println(io, ">> ", tags.id)
	println(io, ">> ", tags.comments)	
end

#End
