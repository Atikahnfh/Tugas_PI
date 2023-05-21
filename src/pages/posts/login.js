import Link from 'next/link';
import Navbar from '../components/navbar';

import React, { Children } from 'react';

const Login = () => {
  return (
    <>
    <Navbar />
    <section className="h-screen flex flex-col md:flex-row justify-center space-y-10 md:space-y-0 md:space-x-16 items-center my-2 mx-5 md:mx-0 md:my-0">
      <div className="md:w-1/3 max-w-sm">
        <img src="https://tecdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp" alt="Sample image" />
      </div>
      <div className="md:w-1/3 max-w-sm bg-blue-100 px-8 py-8 rounded-lg">
        <div className="text-center md:text-left mb-5">
          <label className="mr-1 font-semibold text-xl text-slate-500">Login</label>
        </div>
        
        <input className="text-sm w-full px-4 py-2 border border-solid border-gray-300 rounded-lg" type="text" placeholder="Email Address" />
        <input className="text-sm w-full px-4 py-2 border border-solid border-gray-300 rounded-lg mt-4" type="password" placeholder="Password" />
        <input className="text-sm w-full px-4 py-2 border border-solid border-gray-300 rounded-lg mt-4" type="token" placeholder="token" />

        <div className="mt-4 flex justify-between font-semibold text-sm">
          <label className="flex text-slate-500 hover:text-slate-600 cursor-pointer">
            <input className="mr-1" type="checkbox" />
            <span>Remember Me</span>
          </label>
          <a className="text-blue-600 hover:text-blue-700 hover:underline hover:underline-offset-4" href="#">Forgot Password?</a>
        </div>
        <div className="text-center md:text-left">
          <button className="mt-4 bg-primary py-2 px-4 rounded-lg hover:shadow-lg hover:opacity-80 trasition duration-300 ease-in-out text-white text-xs shadow-md tracking-wider" type="submit">Login</button>
        </div>
        {/* <div className="mt-4 font-semibold text-sm text-slate-500 text-center md:text-left">
          Don't have an account? <a className="text-red-600 hover:underline hover:underline-offset-4" href="#">Register</a>
        </div> */}
      </div>
    </section>
    </>
  );
};

export default Login;