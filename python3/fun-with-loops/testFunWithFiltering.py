# to run this, just run this in this dir:
#   python -m unittest discover

import unittest
import funWithFiltering


class TestShouldShow(unittest.TestCase):

    def testSimpleShow(self):
        self.assertTrue(
            funWithFiltering.shouldShowItem(
                {
                    "name": "idk lol",
                    'hidden': False,
                    "ignore": False,
                }
            )
        )

    def testThrowsError(self):

        didThrow = False
        try:
            funWithFiltering.shouldShowItem(
                {"hidden": False,
                 "name": "wow I am missing some keys, huh? :P"})
        except KeyError as e:
            didThrow = True
        
        self.assertTrue(didThrow)
