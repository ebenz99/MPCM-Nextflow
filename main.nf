process pre {
    output:
    file 'scale.txt' into numbers

    """
    for i in {1..5}
    do
       echo $i >> scale.txt
    done
    """
}

process test {
  input:
  val x from numbers

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





