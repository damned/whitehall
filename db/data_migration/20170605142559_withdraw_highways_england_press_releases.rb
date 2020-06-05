require "ruby-progressbar"

class WithdrawHighwaysEnglandPressReleases
  def run!
    withdrawing_user = ::User.find_by!(name: "GDS Inside Government Team")
    progress_bar = ProgressBar.create!(autostart: false, format: "%e [%b>%i] [%c/%C]")

    progress_bar.total = edition_ids.size
    progress_bar.start
    ::Edition.where(id: edition_ids).find_each do |edition|
      progress_bar.log("Withdrawing edition ##{edition.id}")
      withdrawer = ::Whitehall.edition_services.withdrawer(
        edition,
        user: withdrawing_user,
        remark: "Withdrawn",
        unpublishing: {
          unpublishing_reason: ::UnpublishingReason::Withdrawn,
          explanation: <<-EXPLANATION.strip_heredoc,
            These bulletins are now sent directly to journalists. Contact the [Highways England Press Office](https://www.gov.uk/government/organisations/highways-england/about/media-enquiries) directly to be added to the circulation list.

            Otherwise you can check on the [live roadworks search tool](http://roads.highways.gov.uk/).
          EXPLANATION
        },
      )
      withdrawer.perform!
      progress_bar.increment
    end
    progress_bar.finish
  end

  def edition_ids
    <<~SO_MANY_IDS.strip_heredoc.each_line.map(&:chomp)
      693449
      489429
      492113
      517470
      551220
      502502
      495844
      498095
      553781
      494170
      575916
      647620
      558280
      560862
      667418
      640332
      686639
      659429
      651729
      508830
      562787
      695339
      669579
      642292
      661512
      680159
      653544
      565163
      697747
      645209
      663080
      682262
      655538
      665266
      699566
      609350
      637577
      657675
      570159
      675972
      649969
      693173
      589106
      612120
      580172
      572603
      594423
      623765
      614518
      582599
      619535
      605076
      595904
      626028
      617080
      585598
      598921
      629797
      600582
      621389
      607907
      671499
      678229
      673392
      486941
      691814
      619202
      680105
      644720
      708327
      684443
      649767
      588600
      667423
      530746
      611974
      580218
      640342
      659384
      551535
      520223
      631566
      602653
      508816
      623502
      533420
      582561
      498149
      523116
      633158
      575446
      605072
      544560
      511839
      653444
      595977
      565101
      616708
      525543
      717803
      682267
      514239
      558414
      673381
      657230
      517473
      629675
      600723
      675764
      505090
      693955
      538210
      665251
      647104
      588611
      589113
      502536
      530679
      667323
      612075
      580095
      495984
      640346
      686846
      551245
      659719
      487400
      704223
      520225
      631513
      713805
      542319
      572991
      602603
      678265
      651780
      594055
      508822
      695496
      623773
      562628
      533410
      669834
      614397
      582562
      498090
      642244
      553800
      661082
      619195
      558361
      489274
      705746
      523088
      633154
      715648
      544563
      575369
      605067
      680134
      653712
      595892
      511559
      697603
      626048
      565231
      535501
      671516
      617109
      585579
      500590
      644608
      555967
      663231
      491865
      708380
      526038
      635072
      717748
      607508
      682287
      682292
      546911
      655552
      598191
      514180
      720331
      527994
      665078
      699407
      628557
      567526
      537943
      673346
      609293
      494168
      637624
      684312
      549142
      657288
      701799
      517477
      629778
      711251
      570031
      600608
      675823
      540119
      649759
      591907
      505091
      693312
      621319
      560847
      692250
      715340
      557529
      542354
      609353
      646832
      588246
      502584
      530707
      667314
      611990
      580059
      495896
      686452
      551193
      659387
      703898
      520201
      631443
      572649
      602387
      651695
      593290
      508798
      695138
      623721
      562767
      533548
      669334
      614084
      582344
      642239
      498195
      689168
      661076
      691819
      619504
      558964
      489410
      522635
      633174
      575439
      604831
      680292
      544277
      653429
      595764
      511484
      697180
      625877
      564921
      535278
      671527
      616854
      585542
      644516
      662937
      492134
      708295
      525551
      635213
      634928
      682055
      546814
      655527
      597933
      514185
      528164
      665103
      699356
      628695
      567349
      537777
      673953
      577770
      577948
      637410
      494136
      684177
      549432
      657302
      485069
      701697
      517118
      629774
      710876
      570046
      600377
      675979
      539962
      649594
      590912
      505019
      693313
      621136
      560857
      607738
      640322
      717755
      713233
      538384
      539935
      575421
      647092
      588322
      502563
      530656
      667319
      612069
      579989
      496005
      640317
      551138
      659623
      686825
      487411
      703891
      520228
      631483
      713231
      572979
      602499
      542212
      678910
      651732
      593621
      508818
      623763
      563031
      695516
      533226
      669816
      614335
      582553
      498085
      642289
      553612
      661141
      558378
      489285
      705842
      522821
      633149
      715319
      604974
      544389
      679988
      653727
      595857
      511492
      625880
      564984
      697587
      535785
      671525
      617104
      585519
      644451
      555810
      663072
      491838
      708292
      525883
      635038
      717897
      546884
      682290
      598122
      514068
      720322
      527979
      665081
      699375
      567418
      673373
      609254
      577714
      494186
      637549
      549079
      657266
      684309
      701867
      529277
      629766
      710857
      570008
      600591
      675815
      649407
      591890
      504947
      621309
      560852
      693338
      500584
      607501
      619501
      692246
      655724
      628741
      713808
      715352
      487001
      647146
      588593
      502583
      530768
      667751
      580183
      640363
      495722
      686660
      551373
      551491
      659723
      706484
      520202
      631560
      572693
      602704
      678180
      542480
      651783
      593564
      508795
      695354
      623745
      563011
      533554
      669362
      582687
      642251
      498201
      688986
      661209
      619541
      558418
      489432
      708543
      706615
      523139
      633268
      605078
      680170
      544716
      653710
      595991
      511841
      697184
      626049
      565343
      500587
      616923
      585664
      644631
      557497
      662931
      492171
      494218
      635032
      717783
      682265
      546918
      655710
      598271
      514243
      528590
      665253
      699749
      628696
      567574
      537928
      673955
      609356
      577776
      637632
      684449
      549441
      657327
      485071
      702268
      517469
      629801
      710719
      570134
      600632
      675955
      540138
      649700
      591309
      693448
      621079
      560865
      607502
      540027
      651815
      623607
      633475
      635473
      682280
      701848
      657307
      588504
      667758
      530690
      640387
      612183
      580131
      686546
      551358
      703954
      520204
      713811
      678200
      572692
      602605
      542239
      594197
      695304
      563033
      533300
      614499
      582684
      689014
      553733
      691807
      619513
      558387
      705857
      522951
      715970
      679990
      604829
      544537
      653586
      596010
      698262
      565353
      535408
      616850
      556196
      708329
      525446
      717907
      607452
      546858
      598136
      528160
      665622
      699364
      567645
      537900
      673388
      577806
      609359
      684295
      549446
      629780
      710935
      570187
      675954
      600630
      649769
      621405
      560690
      646827
      558278
      649344
      588429
      502543
      531943
      667153
      612049
      579999
      639933
      495936
      686656
      551530
      659714
      487406
      703956
      520226
      631605
      713236
      572982
      602642
      678208
      542310
      651591
      593622
      508820
      695593
      623771
      562560
      533230
      669825
      614270
      582555
      642098
      498064
      553506
      661425
      692252
      619539
      489431
      705858
      522867
      633133
      715326
      575372
      604980
      679915
      544426
      653732
      595878
      511497
      697593
      625961
      565095
      535494
      671549
      617097
      585607
      644463
      500423
      556072
      492034
      708371
      525876
      635047
      717585
      607507
      682363
      546881
      655549
      598073
      514135
      720326
      527943
      665102
      699370
      628558
      567493
      537922
      673337
      609259
      577718
      494143
      637340
      684315
      549235
      657272
      701912
      517476
      629760
      710665
      569929
      600586
      675824
      539927
      591898
      505042
      693456
      621174
      560587
      485067
      502575
      495985
      509068
      498118
      511441
      585665
      644724
      514241
      494188
      505092
      487024
      502586
      646797
      588885
      530750
      667762
      496013
      640384
      613327
      580225
      551376
      686879
      659733
      631684
      713815
      704244
      678258
      572817
      602703
      542292
      594062
      508805
      696157
      623741
      563369
      533396
      669642
      498197
      642321
      614515
      583394
      553502
      661422
      692446
      619522
      558502
      489418
      633283
      715350
      706806
      523112
      575748
      604968
      680169
      544497
      653585
      595899
      511487
      565356
      697550
      626344
      671545
      535673
      617093
      644707
      587294
      555853
      663223
      491855
      709520
      525564
      634843
      717567
      682255
      546956
      655740
      598376
      514152
      528010
      720334
      665647
      699520
      628571
      567749
      673965
      494210
      577773
      637588
      609611
      684303
      549424
      657693
      710963
      702259
      517472
      629854
      570199
      600526
      675956
      540133
      649752
      591177
      505088
      693333
      621326
      560887
      607491
      577725
      502527
      530734
      495850
      487334
      520088
      542506
      678214
      498113
      489359
      535600
      491861
      525449
      527785
      537909
      673382
      494078
      539665
      504980
      523120
      511516
      514498
      517474
      612053
      575450
      625958
      598381
      629934
      600439
      591150
      621371
      588336
      647531
      667421
      580081
      640324
      551228
      686541
      659615
      704250
      631820
      713826
      572638
      602552
      593474
      652044
      508622
      562654
      695360
      624087
      669749
      533415
      582551
      614402
      642246
      689009
      553650
      661145
      558504
      620523
      705859
      633281
      715841
      544587
      604969
      680100
      595896
      653495
      565250
      697562
      616860
      585533
      555884
      663017
      708331
      634923
      717569
      607773
      682241
      546757
      655753
      665616
      720110
      699550
      628699
      567492
      609281
      549180
      684447
      657394
      701791
      570035
      649699
      560845
      671510
      591234
      539886
      530756
      487340
      525142
      542659
      489362
      523106
      511379
      535597
      555886
      492023
      525445
      514147
      527938
      537789
      504993
      517475
      546734
      549202
      704220
      631494
      533313
      689557
      705878
      633180
      715949
      544603
      708390
      717578
      720399
      567484
      684445
      702253
      710873
      539924
      492029
      502582
      703953
      678244
      695183
      701909
      489422
      567650
      494214
      496007
      686457
      713802
      542269
      593482
      562725
      669570
      614416
      642972
      553663
      705862
      715950
      697186
      535418
      671496
      585528
      635079
      607460
      546828
      598275
      528057
      699360
      577802
      609597
      637655
      549436
      485068
      710930
      570191
      590999
      621358
      560870
      655543
      502524
      530519
      495853
      487336
      678221
      508690
      498111
      558045
      489426
      671528
      491862
      525436
      527717
      537550
      673370
      577703
      494069
      539671
      504977
      519816
      523124
      514495
      517292
      631501
      647604
      588221
      667766
      611983
      580036
      639929
      551207
      659614
      703957
      713234
      572390
      602390
      542538
      651761
      593300
      695141
      624094
      562539
      533256
      669684
      614242
      582347
      642117
      688983
      553449
      661073
      619198
      706763
      633295
      715849
      575303
      604853
      680088
      544264
      653435
      595755
      697569
      625964
      565240
      535420
      616694
      585329
      644454
      555745
      663113
      708202
      634763
      717908
      682448
      547177
      598389
      720397
      665614
      699525
      567390
      609101
      684753
      549170
      657389
      702271
      629680
      570039
      600403
      590902
      694642
      621120
      560832
      608125
    SO_MANY_IDS
  end
end

WithdrawHighwaysEnglandPressReleases.new.run!
