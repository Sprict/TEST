
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PositionSelect : MonoBehaviour
{
    private List<Joycon> Joycons;
    private Joycon JoyconR;

    public Transform cube;

    // Start is called before the first frame update
    void Start()
    {
        Joycons = JoyconManager.Instance.j;
        JoyconR = Joycons.Find( c => !c.isLeft );
    }

    // Update is called once per frame
    void Update()
    {
        float[] stick = JoyconR.GetStick();
        Debug.Log(stick.Length);
        Debug.Log("stick0    " + stick[0]);
        Debug.Log("stick1    " + stick[1]);
        if(stick[0] > 0.7)
        {
            cube.transform.position += Vector3.right * Time.deltaTime;
        }
        if(stick[0] < -0.7)
        {
            cube.transform.position += -Vector3.right * Time.deltaTime;
        }
        if(stick[1] > 0.7)
        {
            cube.transform.position += Vector3.forward * Time.deltaTime;
        }
        if(stick[1] < -0.7)
        {
            cube.transform.position += -Vector3.forward * Time.deltaTime;
        }
    }
}
