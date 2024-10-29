#!/bin/sh

pandoc OSCP-Exam-Report-Template-Markdown/src/OSCP-exam-report-template_whoisflynn_v3.2.md \
-o OSCP-Exam-Report-Template-Markdown/output/OSCP-OS-XXXXX-Exam-Report.pdf \
--from markdown+yaml_metadata_block+raw_html \
--template eisvogel \
--table-of-contents \
--toc-depth 6 \
--number-sections \
--top-level-division=chapter \
--highlight-style SpringGreen \
--resource-path=.:src