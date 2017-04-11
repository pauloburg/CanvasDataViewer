USE [CanvasDataLevel2]
GO
/****** Object:  Schema [QRY]    Script Date: 4/11/2017 10:15:45 AM ******/
CREATE SCHEMA [QRY]
GO
/****** Object:  Schema [RDR]    Script Date: 4/11/2017 10:15:45 AM ******/
CREATE SCHEMA [RDR]
GO
/****** Object:  View [RDR].[vAssignment]    Script Date: 4/11/2017 10:15:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [RDR].[vAssignment]
AS
SELECT        vas.canvas_id AS assignment_canvas_id, vcs.course_canvas_id, vcs.course_sis_source_id, vcs.course_code, vap.title AS assignment_title, vas.due_at, vas.points_possible, vas.submission_types, 
                         vas.grading_type
FROM            CanvasDataLevel1.dbo.vAssignment AS vas INNER JOIN
                         CanvasDataLevel1.dbo.vCourse AS vcs ON vas.course_id = vcs.course_id INNER JOIN
                         CanvasDataLevel1.dbo.vAssignmentPrompts AS vap ON vas.id = vap.id


GO
/****** Object:  View [RDR].[vMessageCopies]    Script Date: 4/11/2017 10:15:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [RDR].[vMessageCopies]
AS
SELECT        mbd.id, mbd.subject, mbd.body, own.sortable_name AS Owner, aut.sortable_name AS Author, msg.conversation_id, msg.conversation_message_id
FROM            CanvasDataLevel1.dbo.vMessage AS msg INNER JOIN
                         CanvasDataLevel1.dbo.vMessageBodies AS mbd ON mbd.id = msg.conversation_message_id LEFT OUTER JOIN
                         CanvasDataLevel1.dbo.vUsers AS aut ON msg.author_id = aut.id LEFT OUTER JOIN
                         CanvasDataLevel1.dbo.vUsers AS own ON own.id = msg.user_id


GO
/****** Object:  View [RDR].[vRequests]    Script Date: 4/11/2017 10:15:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [RDR].[vRequests]
AS
SELECT        vcs.course_sis_source_id, vcs.course_code, vus.sortable_name, vus.sis_user_id, vus.unique_name, vrs.timestamp_month, vrs.timestamp, vrs.id, vrs.discussion_id, vrs.conversation_id, vrs.assignment_id, 
                         vrs.url, vrs.http_method, vrs.web_application_controller, vrs.web_application_context_type, vrs.web_application_context_id, vrs.remote_ip, vrs.user_agent, vrs.interaction_micros
FROM            CanvasDataLevel1.dbo.vCourse AS vcs INNER JOIN
                         CanvasDataLevel1.dbo.vRequests AS vrs ON vcs.course_id = vrs.course_id INNER JOIN
                         CanvasDataLevel1.dbo.vUsers AS vus ON vrs.user_id = vus.id


GO
/****** Object:  View [RDR].[vSubmission]    Script Date: 4/11/2017 10:15:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [RDR].[vSubmission]
AS
SELECT        vSubmission_1.canvas_id, vcs.course_canvas_id, vcs.course_code, vcs.course_sis_source_id, vap.title, vus.sortable_name, vus.sis_user_id, vus.unique_name, vAssignment_1.due_at, 
                         vSubmission_1.submitted_at, vAssignment_1.points_possible, vSubmission_1.score, vSubmission_1.grade, vSubmission_1.published_grade
FROM            CanvasDataLevel1.dbo.vCourse AS vcs INNER JOIN
                         CanvasDataLevel1.dbo.vAssignment AS vAssignment_1 ON vcs.course_id = vAssignment_1.course_id RIGHT OUTER JOIN
                         CanvasDataLevel1.dbo.vSubmission AS vSubmission_1 LEFT OUTER JOIN
                         CanvasDataLevel1.dbo.vUsers AS vus ON vSubmission_1.user_id = vus.id LEFT OUTER JOIN
                         CanvasDataLevel1.dbo.vAssignmentPrompts AS vap ON vSubmission_1.assignment_id = vap.id ON vAssignment_1.id = vSubmission_1.assignment_id


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "vas"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 310
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vcs"
            Begin Extent = 
               Top = 6
               Left = 348
               Bottom = 136
               Right = 598
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vap"
            Begin Extent = 
               Top = 6
               Left = 636
               Bottom = 136
               Right = 806
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'RDR', @level1type=N'VIEW',@level1name=N'vAssignment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'RDR', @level1type=N'VIEW',@level1name=N'vAssignment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "msg"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 302
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "mbd"
            Begin Extent = 
               Top = 6
               Left = 340
               Bottom = 136
               Right = 510
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aut"
            Begin Extent = 
               Top = 6
               Left = 548
               Bottom = 136
               Right = 734
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "own"
            Begin Extent = 
               Top = 6
               Left = 772
               Bottom = 136
               Right = 958
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'RDR', @level1type=N'VIEW',@level1name=N'vMessageCopies'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'RDR', @level1type=N'VIEW',@level1name=N'vMessageCopies'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[66] 4[3] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "vcs"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 288
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vrs"
            Begin Extent = 
               Top = 6
               Left = 326
               Bottom = 136
               Right = 573
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vus"
            Begin Extent = 
               Top = 6
               Left = 611
               Bottom = 136
               Right = 797
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'RDR', @level1type=N'VIEW',@level1name=N'vRequests'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'RDR', @level1type=N'VIEW',@level1name=N'vRequests'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "vcs"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 288
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vAssignment_1"
            Begin Extent = 
               Top = 6
               Left = 326
               Bottom = 136
               Right = 598
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vSubmission_1"
            Begin Extent = 
               Top = 6
               Left = 636
               Bottom = 136
               Right = 913
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vus"
            Begin Extent = 
               Top = 6
               Left = 951
               Bottom = 136
               Right = 1137
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vap"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350' , @level0type=N'SCHEMA',@level0name=N'RDR', @level1type=N'VIEW',@level1name=N'vSubmission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'RDR', @level1type=N'VIEW',@level1name=N'vSubmission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'RDR', @level1type=N'VIEW',@level1name=N'vSubmission'
GO
