{{#families}}
{{#parity}}
\newpage
\setcounter{page}{ {{curr_page}} }
\thisfancypage{%
  \doublebox}{}
\mbox{}
\begin{center}
{{/parity}}
{{=<% %>=}}
\includegraphics[width=3.8in]{<%&assets%>/members/<%img%>}
<%={{ }}=%>
\\
\parbox[c]{2.8in}{
  \scalefont{0.55}
  {{ name }}\\
  \scalefont{0.85}
{{#comments}}
  {{comments}} \\
{{/comments}}
  {{clean_address}} \\
  {{city}}, {{state}} {{zip}}
}
\\*
\scalefont{0.5}
{{formatted_contact}}
\vspace{0.1in} 
{{&formatted_birthdays}}
\\
\vspace{0.1in}
\scalefont{2}

{{^parity}}
\end{center}
{{/parity}}
{{/families}}

{{#close}}
\end{center}
{{/close}}
