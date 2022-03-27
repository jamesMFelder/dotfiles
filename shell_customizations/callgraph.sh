# Create a flowgraph at $1 for a project
function callgraph_project(){
	# Find all c and c++ files not in a CMakeFiles directory.
	find . \( -type d -name CMakeFiles -prune \) -o -type f \( -name '*.c' -o -name '*.cpp' -o -name '*.cxx' -o -name '*.C' \) -print0 |\
	# Run the cflow command on them and output in the dot format
	xargs --null cflow -f dot |\
	# Output a pdf to whatever we were called with, defaulting to callgraph.pdf
	dot -Tpdf -o "${1:-callgraph.pdf}"
}
