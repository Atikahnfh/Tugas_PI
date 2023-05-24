import { useState, useEffect } from 'react';
import { useRouter } from 'next/router';
import Navbar from '../../components/navbar';
import Sidebar from '../../components/sidebar';
import Link from 'next/link';

function DeleteBeasiswa() {
    return(
    <>
    <Navbar/>
    <Sidebar/>
    </>
)}

export default DeleteBeasiswa;
