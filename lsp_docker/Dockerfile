FROM frolvlad/alpine-miniconda3

RUN conda update -n base -c defaults conda
RUN conda create -c conda-forge -n lsp 'python >=3.7,<3.8' 'jupyterlab=1.2' 'nodejs=11' python-language-server

RUN source activate lsp
#  Install Jupyterlabs
# RUN conda install -c conda-forge jupyterlab==1.2
# EXPOSE 8888

# RUN conda install -c conda-forge 'jupyter_lsp==0.7' --no-deps
# RUN jupyter labextension install '@krassowski/jupyterlab-lsp@0.7.1'
