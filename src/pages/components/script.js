import React from 'react';

const Script = ({children}) => {
  return (
    
    <script>
    if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {document.documentElement.classList.add('dark')}
     else {document.documentElement.classList.remove('dark')}
</script>
  );
};

export default Script;