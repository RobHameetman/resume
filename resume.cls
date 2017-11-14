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
\ProcessOptions*
\LoadClass[letterpaper]{article}


%-------------------------------------------------------------------------------
%                Directories
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir


%-------------------------------------------------------------------------------
%                Packages
%-------------------------------------------------------------------------------
\RequirePackage{fontspec}
\RequirePackage{geometry}
\RequirePackage[unicode]{hyperref}
\RequirePackage{ragged2e}
\RequirePackage{setspace}
\RequirePackage{xcolor}


%-------------------------------------------------------------------------------
%                PDF Metadata
%-------------------------------------------------------------------------------
\hypersetup{
	pdftitle={},
	pdfauthor={},
	pdfsubject={},
	pdfkeywords={}
}


%-------------------------------------------------------------------------------
%                Page Margins
%-------------------------------------------------------------------------------
\geometry{
	left		= 1.25in,
	top			= .75in,
	right		= .5in,
	bottom		= .75in
}


%-------------------------------------------------------------------------------
%                Colors
%-------------------------------------------------------------------------------
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{grey}{HTML}{666666}

\definecolor{blue}{HTML}{0000FF}

\colorlet{text}{grey}


%-------------------------------------------------------------------------------
%                Fonts
%-------------------------------------------------------------------------------
% OCR-B
\newfontfamily\ocrb[
  Path			= \@fontdir/ocrb/,
  Extension		= .otf
]{OCR-B}%

% Arial
\newfontfamily\arial[%
  Path			= \@fontdir/arial/,
  Extension		= .ttf,
  UprightFont	= *-Regular,
  ItalicFont	= *-Italic,
  BoldFont		= *-Black
]{Arial}


%-------------------------------------------------------------------------------
%                Definitions
%-------------------------------------------------------------------------------

% Name
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}

% Title
\newcommand*{\jobtitle}[1]{\def\@jobtitle{#1}}

% Mobile
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Email
\newcommand*{\email}[1]{\def\@email{#1}}

% Homepage
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Github
\newcommand*{\github}[1]{\def\@github{#1}}

% Linkedin
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Stack Overflow
\newcommand*{\stackoverflow}[1]{\def\@stackoverflow{#1}}


%-------------------------------------------------------------------------------
%                Styles
%-------------------------------------------------------------------------------
\newcommand*{\headertitlestyle}[2]{{\fontsize{18pt}{1em}\ocrb\color{blue}
	#1\\%	\@firstname
	#2%		\@lastname
}}


%-------------------------------------------------------------------------------
%                Environments
%-------------------------------------------------------------------------------
\newenvironment{header}{
	\begin{flushleft}
		\begin{spacing}{1.4}
}{
		\end{spacing}
	\end{flushleft}
}


%-------------------------------------------------------------------------------
%                Render
%-------------------------------------------------------------------------------
\newcommand*{\renderheader}{
	\begin{header}
		\headertitlestyle{\@firstname}{\@lastname}
	\end{header}
}
	