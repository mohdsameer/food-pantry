import React, { useState, useEffect, createContext, useContext } from 'react';
import { userService} from '../../services';

const authContext = createContext();
const authActionsContext = createContext();

export const useAuthContext = () => useContext(authContext);
export const useAuthActionsContext = () => useContext(authActionsContext);

export const AuthContextProvider = (props) => {
  const [authUser, setAuthUser] = useState({});
  const [loggedIn, setLoggedIn] = useState(false);

  useEffect(()=> {
    if (Object.keys(authUser).length === 0) {
      loadUser();
    }
  }, [])

  const loadUser = async () => {
    setLoggedIn(false);
    
    setAuthUser(user);
    setLoggedIn(true);
  };

  const loginUser = async (user) => {
    
    loadUser();
  };

  return (
    <authContext.Provider value={{authUser, loggedIn}}>
      <authActionsContext.Provider value={loginUser}>
        {props.children}
      </authActionsContext.Provider>
    </authContext.Provider>
  )
}
