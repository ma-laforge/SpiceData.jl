#Test code
#-------------------------------------------------------------------------------

using SpiceData
import CppSimData

#No real test code yet... just demonstrate use:

testpath(testfile::AbstractString) = joinpath(CppSimData.rootpath, "core/data", testfile)

testfile = "test.tr0"
filepath = testpath(testfile)
println("\nLoad $filepath:")
reader = SpiceData._open(filepath)
@show(reader)

println("\nRead in list of signal names:")
@show names(reader)

signame = reader.sweepname
println("\nRead in sweep vector \"$signame\":")
t = reader.sweep
@show t[1], t[end]

signame = "vin"
println("\nRead in \"$signame\" vector:")
v = read(reader, signame)
@show v[1], v[end]

:Test_Complete
