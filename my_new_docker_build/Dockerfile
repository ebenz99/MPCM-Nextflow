FROM python:3
FROM continuumio/anaconda3
RUN conda config --append channels conda-forge
RUN conda install numpy
RUN conda install sundials
RUN conda install pandas

ADD my_script.py /

CMD [ "python", "./my_script.py" ]