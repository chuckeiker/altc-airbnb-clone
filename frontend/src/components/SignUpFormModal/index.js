import './SignUpFormModal.css'

function SignUpFormModal({openSignUpModal}) {

  return (
    <>
      <button onClick={openSignUpModal}>Sign Up</button>
    </>
  );
}

export default SignUpFormModal;