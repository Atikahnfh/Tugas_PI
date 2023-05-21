import Header from '../pages/components/header';
import Footer from '../pages/components/footer';
import Main from '../pages/components/main';
import About from '../pages/components/about';
import Client from '../pages/components/client';
import Contact from '../pages/components/contact';
import Link from 'next/link';
import Beasiswa from './components/beasiswa';
import Script from 'next/script';
import Head from 'next/head';


const Home = ({ children }) => {
  return (
    <div>
      <Head/>
      <Script/>
      <Header />
      <Main />
      <About/>
      <Beasiswa/>
      <Client/>
      <Contact/>
      {children}
      <Footer />
    </div>
    
  );
};

export default Home;