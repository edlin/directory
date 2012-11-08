{{#members}}
{{^parity}}
\newpage
\setcounter{page}{ {{curr_page}} }
\thisfancypage{%
  \doublebox}{}

\mbox{}
\scalefont{0.5}
\begin{center}
\begin{tabular}{l@{\hskip 0.8in}l}
{{/parity}}
\multirow{10}{*}{
{{=<% %>=}}
  \includegraphics[width=1.2in]{<%&assets%>/members/<%img%>}
<%={{ }}=%>
} & \\ 
& {{name}} \\
& {{phone}} \\
& {{email}} \\
& \\
& {{clean_address}} \\
& {{city}}, {{state}} {{zip}} \\
& \\
& {{&formatted_birthday}}\\
& \\
{{#fourth}}
\end{tabular}
\end{center}
\scalefont{2}
{{/fourth}}

{{/members}}
{{#close}}
\end{tabular}
\end{center}
\scalefont{2}
{{/close}}
