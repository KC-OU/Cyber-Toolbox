#!/bin/sh -e

# Check if the system is updated

sudo apt update

# Install the required packages
sudo apt install -y texlive-latex-recommended texlive-fonts-extra texlive-latex-extra pandoc p7zip-full 


# Clone the OSCP Exam Report Template
git clone https://github.com/noraj/OSCP-Exam-Report-Template-Markdown.git

