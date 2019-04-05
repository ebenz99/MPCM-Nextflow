FROM python:3
FROM continuumio/anaconda3
RUN conda config --append channels conda-forge
RUN conda install numpy
RUN conda install sundials
RUN conda install pandas
RUN conda install assimulo
RUN conda install xlrd

ADD . /

CMD [ "python", "./test2.py" ]
