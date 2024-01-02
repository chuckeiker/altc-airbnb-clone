import './LoginFormModal.css'

function LoginFormModal({openLoginModal}) {

  return (
    <>
      <button onClick={openLoginModal}>Log In</button>
    </>
  );
}

export default LoginFormModal;