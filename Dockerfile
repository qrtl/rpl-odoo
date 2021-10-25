FROM rfhk/odoo:12.0
MAINTAINER Quartile Limited <info@quartile.co>

# Install Odoo Python dependencies (Custom)
ADD requirements.txt /opt/custom_requirements.txt
RUN pip install -r /opt/custom_requirements.txt

# Install LibreOffice for report_py3o and ptext-printing tools for treepoem
RUN set -x; \
  apt-get install -y --no-install-recommends \
    libreoffice
    ghostscript
    ttf-mscorefonts-installer

# Install default fonts to the environment.
RUN fc-cache -f
