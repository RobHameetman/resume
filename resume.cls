% Resume Class File
%
% Author:
% Robert Hameetman <rob@rham.io>
% http://rham.io
%
% Notes:
%    This class file acts as a master page by defining the structure and 
%    layout of the resume tex file (resume.tex).
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
\RequirePackage[hidelinks,unicode]{hyperref}
\RequirePackage{l3regex}
\RequirePackage{luacode}
\RequirePackage{ragged2e}
\RequirePackage{setspace}
\RequirePackage{xcolor}
\RequirePackage{xstring}


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
\colorlet{hyperlink}{blue}


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
%                Luacode
%-------------------------------------------------------------------------------
\begin{luacode}
	function phonetic ( surname )
		if type(surname) == "string" then
			local regex = "(\%a\%a)(\%a\%a\%a\%a)(\%a\%a\%a)"
			local one, two, three = string.match( string.lower( surname ), regex)

			local result = "("..one.." · ".."\\textbf{"..two.."} · "..three..")"
		
			tex.print( result )
		end
	end
\end{luacode}


%-------------------------------------------------------------------------------
%                Styles
%-------------------------------------------------------------------------------
\newcommand*{\headertitlestyle}[2]{{\fontsize{18pt}{1em}\ocrb\color{blue}
	#1\\%	\@firstname
	#2\\%	\@lastname
}}

\newcommand*{\headerphoneticstyle}[1]{{\fontsize{11pt}{1em}\arial\color{black}
	\directlua{ tex.write( phonetic( \luastring{#1} ))}\\
	% TODO: make 'meet' bold
}}

\newcommand*{\headermobilestyle}[1]{{\fontsize{11pt}{1em}\arial\color{blue}
	\href{tel:{#1}}{#1}\\
}}

\newcommand*{\headeremailstyle}[2]{{\fontsize{11pt}{1em}\arial\color{blue}
	\href{mailto:{#1}}{#1}\\
	\href{http://{#2}}{http://{#2}}\\
}}

\newcommand*{\headersocialstyle}[2]{{\fontsize{11pt}{1em}\arial\color{blue}
	\href{https://github.com/#1}{https://github.com/#1}\\
	\href{https://linkedin.com/in/#2}{https://linkedin.com/in/#2}\\
}}


%-------------------------------------------------------------------------------
%                Environments
%-------------------------------------------------------------------------------
\newenvironment{header}{
	\begin{flushleft}
}{
	\end{flushleft}
}

\newenvironment{headertitle}{
	\begin{spacing}{1.4}
}{
	\end{spacing}
}

\newenvironment{headermobilelink}{
	\begin{spacing}{1.4}
}{
	\end{spacing}
}


\newenvironment{headeremaillinks}{
	\begin{spacing}{1.4}
}{
	\end{spacing}
}


\newenvironment{headersociallinks}{
	\begin{spacing}{1.4}
}{
	\end{spacing}
}



%-------------------------------------------------------------------------------
%                Render
%-------------------------------------------------------------------------------
%\newcommand*{\phonetic}[1]{{\regex_extract_all:nnNTF{\A(\w+)(\w\w\w\w)(\w+)\Z}{#1}
%	\seq{\verb=(=\seq · \textbf{\seq} · \seq)}
%}}

%\newcommand*{\src}[2]{%
%	\directlua{ src("\luatexluaescapestring{\unexpanded{#1}}","\luatexluaescapestring{\unexpanded{#2}}")}
%}

\newcommand*{\renderheader}{%
	\begin{header}
		\begin{headertitle}
			\headertitlestyle{\@firstname}{\@lastname}
			\headerphoneticstyle{\@lastname}
		\end{headertitle}
		\begin{headermobilelink}
			\headermobilestyle{\@mobile}
		\end{headermobilelink}
		\begin{headeremaillinks}
			\headeremailstyle{\@email}{\@homepage}
		\end{headeremaillinks}
		\begin{headersociallinks}
			\headersocialstyle{\@github}{\@linkedin}
		\end{headersociallinks}
	\end{header}
}
	