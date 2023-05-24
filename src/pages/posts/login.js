import Link from 'next/link';
import Navbar from '../components/navbar';
import React, { Children } from 'react';
import { useRouter } from 'next/router';
import { useState } from 'react';

function Login() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [token, setToken] = useState(''); // Add state for token

  const router = useRouter();

  const handleLogin = async () => {
    // Perform login logic here
    // Example: make an API request to authenticate the user

    try {
      // Make an API request to authenticate the user
      const response = await fetch('http://localhost:8000/api/login', {
        method: 'POST',
        body: JSON.stringify({ email, password, token }),
        headers: {
          'Content-Type': 'application/json'
        }
      });

      if (response.ok) {
        // Redirect to a new page after successful login
        router.push('/admin/dashboard');
      } else {
        // Handle login error
        console.log('Login failed');
      }
    } catch (error) {
      // Handle network or server error
      console.log('Error:', error.message);
    }
  };

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
        
        <input className="text-sm w-full px-4 py-2 border border-solid border-gray-300 rounded-lg" type="text" value={email}
          onChange={(e) => setEmail(e.target.value)}
          placeholder="Email" />
        <input className="text-sm w-full px-4 py-2 border border-solid border-gray-300 rounded-lg mt-4"  type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          placeholder="Password" />
        <input className="text-sm w-full px-4 py-2 border border-solid border-gray-300 rounded-lg mt-4" type="token"  value={token}
            onChange={(e) => setToken(e.target.value)}
            placeholder="Token" />

        <div className="mt-4 flex justify-between font-semibold text-sm">
          <label className="flex text-slate-500 hover:text-slate-600 cursor-pointer">
            <input className="mr-1" type="checkbox" />
            <span>Remember Me</span>
          </label>
          <a className="text-blue-600 hover:text-blue-700 hover:underline hover:underline-offset-4" href="#">Forgot Password?</a>
        </div>
        <div className="text-center md:text-left">
          <button className="mt-4 bg-primary py-2 px-4 rounded-lg hover:shadow-lg hover:opacity-80 trasition duration-300 ease-in-out text-white text-xs shadow-md tracking-wider" type="submit" onClick={handleLogin}>Login</button>
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