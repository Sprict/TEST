using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class colorselect : MonoBehaviour
{
    public Material material;
    [Range(0,1)]
    public float floatValue;
    private int floatValueId;
    public Color GlobalColorValue;
    private int GlobalColorValueID;

    // Start is called before the first frame update
    void Start()
    {
        this.floatValueId = Shader.PropertyToID("_FloatValue");
        this.GlobalColorValueID = Shader.PropertyToID("_GCV");
    }

    // Update is called once per frame
    void Update()
    {
        this.material.SetFloat(floatValueId, this.floatValue);
        Shader.SetGlobalColor(this.GlobalColorValueID, this.GlobalColorValue);
    }
}
