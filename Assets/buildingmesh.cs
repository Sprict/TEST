using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class buildingmesh : MonoBehaviour
{
    
    private Vector3[] vertices_s;
    Mesh mesh;

    void Start()
    {
        mesh = GetComponent<MeshFilter>().mesh;
        vertices_s = mesh.vertices;
    }
    void Update()
    {
        Vector3[] vertices = new Vector3[vertices_s.Length];
       Vector3[] normals = mesh.normals;
       int i = 0;
       while( i < vertices_s.Length) {
           vertices[i] = vertices_s[i] + normals[i] * (Mathf.Sin(Time.time) - 1) / 2;
           i++;
       } 
       mesh.vertices = vertices;
    }
}
