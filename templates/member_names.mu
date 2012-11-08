\newpage
\thispagestyle{empty}
\thisfancypage{%
  \doublebox}{}

\mbox{}
\scalefont{2} 
\\*
\makebox[2.4in][r]{\bf {Members}}
\vspace{0.1in}
\begin{center}
\begin{tabular}{l@{\hskip 1in}l}

{{#members}}
{{&mem_name}}
{{/members}}

\end{tabular}
\end{center}

\newpage
\thispagestyle{empty}
\thisfancypage{%
  \doublebox}{}

\mbox{}
\\*
\makebox[2.25in][r]{\bf {Families}}
\vspace{0.1in}
\begin{center}
\renewcommand{\arraystretch}{1.5}
\begin{tabular}{>{\raggedright \arraybackslash}p{2.4in} @{\hskip 1in} >{\raggedright \arraybackslash}p{2.4in}}

{{#families}}
{{&fam_name}}
{{/families}}

\end{tabular}
\end{center}
