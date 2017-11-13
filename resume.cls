% Resume Class File
%
% Author:
% Robert Hameetman <rob@rham.io>
% http://rham.io
%
% Notes:
%    This class file defines the structure and layout of the resume tex file (resume.tex).
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%


%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2017/11/13 Robert Hameetman Standard Resume class]


%-------------------------------------------------------------------------------
%                Class options
%-------------------------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[letterpaper]{article}


%-------------------------------------------------------------------------------
%                Packages
%-------------------------------------------------------------------------------


%-------------------------------------------------------------------------------
%                Commands
%-------------------------------------------------------------------------------
\renewcommand{\normalsize}{\fontsize{9pt}{11pt}\selectfont}
\setlength{\textwidth}{8.5in}
\setlength{\textheight}{11in}
\pagenumbering{alph}