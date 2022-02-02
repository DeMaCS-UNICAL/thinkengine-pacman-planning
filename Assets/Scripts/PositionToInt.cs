using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PositionToInt : MonoBehaviour
{
    int x;
    int y;

    private void Update()
    {
        x = (int)Math.Floor(transform.position.x);
        y = (int)Math.Floor(transform.position.y);
    }
}
