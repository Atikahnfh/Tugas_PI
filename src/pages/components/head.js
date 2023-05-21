import React from 'react';
import Link from 'next/link';

const Head = () => {
  return (
    <>
    <head>
    <title>Sholarfy</title>
    <script>
        if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        document.documentElement.classList.add('dark')
        } else {
        document.documentElement.classList.remove('dark')
        }
    </script>
    </head>
    </>
  );
};

export default Head;