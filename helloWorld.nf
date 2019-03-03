process foo {
	input:
	val str from "Hello"
	output:
	file 'myfile' into result
	script:
	"""
	echo $str world! > myfile
	"""
}