num = Channel.from( 1, 2, 3 )

process test {
  input:
  val x from num
  
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





