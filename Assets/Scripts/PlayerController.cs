using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{  
    [SerializeField]
    private int moveSpeed = 5;

    [SerializeField]
    private int rotateSpeed = 300;

    private Animator animator;

    private Rigidbody rBody;
    // Start is called before the first frame update
    void Start()
    {
        animator = GetComponent<Animator>();
        rBody = GetComponent<Rigidbody>();
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        if (Input.GetKey(KeyCode.W)) {
            animator.SetBool("isRunning", true);
        }
        else  
        {
            animator.SetBool("isRunning", false); ;
        }


        Rotate();
        Move();


    }

    private void Move() {
        Vector3 movement = transform.forward * Input.GetAxis("Vertical") * moveSpeed * Time.deltaTime;
        rBody.MovePosition(rBody.position + movement);
    }

    private void Rotate() {
        transform.Rotate(Vector3.up * Input.GetAxis("Horizontal") * Time.deltaTime * rotateSpeed);
    }
}
