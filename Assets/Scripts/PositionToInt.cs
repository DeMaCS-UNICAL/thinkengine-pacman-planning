using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PositionToInt : MonoBehaviour
{
    public int x;
    public int y;

    private void Update()
    {
        x = (int)Math.Truncate(transform.position.x);
        y = (int)Math.Truncate(transform.position.y);
    }
}
