using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class charactorcontroller : MonoBehaviour
{
    [SerializeField] private float speed = 2.0f;
    private List<Joycon> joycons;
    private Joycon joyconr;
    private CharacterController cCon;
    private Vector3 moveDirection = Vector3.forward;
    // Start is called before the first frame update
    void Start()
    {
        joycons = JoyconManager.Instance.j;
        if(joycons == null || joycons.Count <= 0) return;

        joyconr = joycons.Find( c => !c.isLeft );
        cCon = GetComponent<CharacterController>();
    }

    // Update is called once per frame
    void Update()
    {
        // var hori = Input.GetAxis("Horizontal");
        // var vert = Input.GetAxis("Vertical");
        var stick = joyconr.GetStick();
        var direction = new Vector3(stick[1], 0f, -stick[0]);
        transform.position += direction * Time.deltaTime * speed;
        if(Input.GetKey(KeyCode.Space))
        {
            cCon.Move(moveDirection * Time.deltaTime);
        }
    }
}
