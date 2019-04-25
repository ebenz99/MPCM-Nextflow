nums = Channel.from(1..5)

process test {
  input:
  val x from nums

  '''
  cd ..
  cd ..
  cd ..
  cd projects
  cd ebenz99
  cd MPCM-Nextflow
  cd Mechanistic_Pan-Cancer_Model
  python test2.py
  '''

}





