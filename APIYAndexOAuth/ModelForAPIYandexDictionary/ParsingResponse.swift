//
//  ParsingResponse.swift
//  WorkApplication
//
//  Created by Anatoly Ryavkin on 30.06.2020.
//  Copyright © 2020 AnatolyRyavkin. All rights reserved.
//

import Foundation
import WebKit
import RxSwift

   let ExampleJSON = """


{
 "head":{},
 "def":[
        {"text":"time",
         "pos":"noun",
         "ts":"taɪm",
         "tr":
              [
                {"text":"время",
                 "pos":"noun",
                 "gen":"ср",
                 "syn":
                            [
                             {"text":"раз",
                              "pos":"noun",
                              "gen":"м"},
                             {"text":"момент",
                              "pos":"noun",
                              "gen":"м"},
                             {"text":"срок",
                              "pos":"noun",
                              "gen":"м"},
                             {"text":"пора",
                              "pos":"noun",
                              "gen":"ж"},
                             {"text":"период",
                              "pos":"noun",
                              "gen":"м"},
                             {"text":"момент времени",
                              "pos":"noun"}
                            ],
                  "mean":
                            [
                             {"text":"period"},
                             {"text":"once"},
                             {"text":"moment"},
                             {"text":"now"}
                            ],
                   "ex":
                            [
                             {"text":"daylight saving time",
                                "tr":
                                     [
                                      {"text":"летнее время"}
                                     ]
                             },
                             {"text":"take some time",
                                "tr":
                                     [
                                      {"text":"занять некоторое время"}
                                     ]
                             },
                             {"text":"real time mode",
                                "tr":
                                     [
                                      {"text":"режим реального времени"}
                                     ]
                             },
                             {"text":"expected arrival time",
                                "tr":
                                     [
                                      {"text":"ожидаемое время прибытия"}
                                     ]
                             },
                             {"text":"external time source",
                                "tr":
                                     [
                                      {"text":"внешний источник времени"}
                                     ]
                             },
                             {"text":"next time",
                                "tr":
                                     [
                                      {"text":"следующий раз"}
                                     ]
                             },
                             {"text":"initial time",
                                "tr":
                                     [
                                      {"text":"начальный момент"}
                                     ]
                             },
                             {"text":"reasonable time frame",
                                "tr":
                                     [
                                      {"text":"разумный срок"}
                                     ]
                             },
                             {"text":"winter time",
                                "tr":
                                     [
                                      {"text":"зимняя пора"}
                                     ]
                             },
                             {"text":"incubation time",
                                "tr":
                                     [
                                      {"text":"инкубационный период"}
                                     ]
                             }
                            ]
                },
                {"text":"час",
                 "pos":"noun",
                 "gen":"м",
                 "mean":
                        [
                         {"text":"hour"}
                        ],
                 "ex":
                        [
                         {"text":"checkout time",
                            "tr":
                                 [
                                  {"text":"расчетный час"}
                                 ]
                         }
                        ]
                 },
                {"text":"эпоха",
                 "pos":"noun",
                 "gen":"ж",
                 "mean":
                        [
                         {"text":"era"}
                        ]
                },
                {"text":"период времени",
                 "pos":"noun",
                 "syn":
                       [
                        {"text":"промежуток времени",
                         "pos":"noun"
                        }
                       ],
                 "mean":
                       [
                        {"text":"period of time"}
                       ]
                },
                {"text":"тайм",
                 "pos":"noun",
                 "gen":"м",
                 "mean":
                        [
                         {"text":"half"}
                        ]
                },
                {"text":"продолжительность",
                 "pos":"noun",
                 "gen":"ж",
                 "mean":
                        [
                         {"text":"duration"}
                        ]
                }
              ]
        },
        {"text":"time",
         "pos":"verb",
         "ts":"taɪm",
         "tr":
              [
                {"text":"приурочивать",
                 "pos":"verb",
                 "asp":"несов",
                 "syn":
                       [
                        {"text":"приурочить",
                         "pos":"verb",
                         "asp":"сов"
                        }
                       ],
                 "mean":
                       [
                        {"text":"date"}
                       ]
                }
              ]
        },
        {"text":"time",
         "pos":"adjective",
         "ts":"taɪm",
         "tr":
              [
               {"text":"временной",
                "pos":"adjective",
                "mean":
                       [
                        {"text":"temporary"}
                       ],
                "ex":
                       [
                        {"text":"time code",
                         "tr":
                              [
                               {"text":"временной код"}
                              ]
                        }
                       ]
               }
              ]
        },
        {"text":"time",
         "pos":"adverb",
         "ts":"taɪm",
         "tr":
              [
               {"text":"своевременно",
                "pos":"adverb",
                "mean":
                       [
                        {"text":"in time"}
                       ]
               }
              ]
        }
       ]
}
"""



class ParsingResponse{

    static let Shared = ParsingResponse.init()

    private init(){
        print("init ParsingResponse")
    }
    deinit {
        print("deinit ParsingResponse")
    }

    //MARK- extracting code to get token

    func getObservableCodeToGetTokenFromResponse(response: HTTPURLResponse) -> Observable<String>? {
        guard let stringResponse = response.url?.absoluteString else{
            return nil
        }
        if stringResponse.range(of: "code=") == nil {
            return nil
        }
        let start = stringResponse.index(stringResponse.endIndex, offsetBy: -7)
        let end = stringResponse.endIndex
        let substringCode = String(stringResponse[start..<end])
        return Observable<String>.of(substringCode)
    }

    

}


