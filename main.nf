num = Channel.from(1..5)

process test {
  input:
  val x from num

  """
  echo $x >> a.txt
  """
}





